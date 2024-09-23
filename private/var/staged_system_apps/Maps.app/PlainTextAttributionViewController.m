@implementation PlainTextAttributionViewController

- (PlainTextAttributionViewController)initWithFileURL:(id)a3
{
  id v5;
  PlainTextAttributionViewController *v6;
  PlainTextAttributionViewController *v7;
  PlainTextAttributionViewController *v8;

  v5 = a3;
  v6 = -[PlainTextAttributionViewController initWithNibName:bundle:](self, "initWithNibName:bundle:", 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_fileURL, a3);
    v8 = v7;
  }

  return v7;
}

- (void)viewDidLoad
{
  UITextView *v3;
  UITextView *textView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UITextView *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PlainTextAttributionViewController;
  -[PlainTextAttributionViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (UITextView *)objc_alloc_init((Class)UITextView);
  textView = self->_textView;
  self->_textView = v3;

  -[UITextView setTranslatesAutoresizingMaskIntoConstraints:](self->_textView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextView setEditable:](self->_textView, "setEditable:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v5, 0.0));
  -[UITextView setFont:](self->_textView, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[UITextView setTextColor:](self->_textView, "setTextColor:", v7);

  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", 0.0, 16.0, 0.0, 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PlainTextAttributionViewController view](self, "view"));
  objc_msgSend(v8, "addSubview:", self->_textView);

  v9 = self->_textView;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PlainTextAttributionViewController view](self, "view"));
  LODWORD(v11) = 1148846080;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITextView _maps_constraintsEqualToEdgesOfView:priority:](v9, "_maps_constraintsEqualToEdgesOfView:priority:", v10, v11));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "allConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", self->_fileURL, 0, 0));
  v15 = v14;
  if (v14)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", objc_msgSend(objc_retainAutorelease(v14), "bytes")));
    -[UITextView setText:](self->_textView, "setText:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_TITLE"), CFSTR("localized string not found"), 0));
  -[PlainTextAttributionViewController setTitle:](self, "setTitle:", v18);

  v19 = objc_alloc((Class)UIBarButtonItem);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("ATTRIBUTION_DONE_BUTTON_TITLE"), CFSTR("localized string not found"), 0));
  v22 = objc_msgSend(v19, "initWithTitle:style:target:action:", v21, 2, self, "_dismiss");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PlainTextAttributionViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v23, "setRightBarButtonItem:", v22);

}

- (void)_dismiss
{
  -[PlainTextAttributionViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
