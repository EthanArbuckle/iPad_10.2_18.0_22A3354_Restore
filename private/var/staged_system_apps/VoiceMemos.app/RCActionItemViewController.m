@implementation RCActionItemViewController

- (void)setActionImage:(id)a3
{
  id v5;
  void *v6;
  id v7;

  objc_storeStrong((id *)&self->_actionImage, a3);
  v5 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionImageView"));
  objc_msgSend(v6, "setImage:", v5);

}

- (UIImage)actionImage
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "image"));

  return (UIImage *)v4;
}

- (void)setActionTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *actionTitle;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (NSString *)objc_msgSend(v4, "copy");
  actionTitle = self->_actionTitle;
  self->_actionTitle = v5;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "actionTitleLabel"));
  objc_msgSend(v7, "setText:", v4);

}

- (NSString)actionTitle
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "actionTitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "text"));

  return (NSString *)v4;
}

- (void)loadView
{
  RecordingActionItemView *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RCActionItemViewController;
  -[RCActionItemViewController loadView](&v4, "loadView");
  v3 = objc_opt_new(RecordingActionItemView);
  -[RCActionItemViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
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
  unint64_t v12;
  void *v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)RCActionItemViewController;
  -[RCActionItemViewController viewDidLoad](&v15, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "actionImageView"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tintColor"));

  objc_msgSend(v4, "setImage:", self->_actionImage);
  objc_msgSend(v4, "setTintColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "actionTitleLabel"));

  objc_msgSend(v8, "setText:", self->_actionTitle);
  objc_msgSend(v8, "setTextColor:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont scaledSystemFontOfSize:](UIFont, "scaledSystemFontOfSize:", 20.0));
  objc_msgSend(v8, "setFont:", v9);

  objc_msgSend(v8, "setAdjustsFontForContentSizeCategory:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  objc_msgSend(v10, "setIsAccessibilityElement:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  v12 = (unint64_t)objc_msgSend(v11, "accessibilityTraits");
  objc_msgSend(v11, "setAccessibilityTraits:", UIAccessibilityTraitButton | v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RCActionItemViewController view](self, "view"));
  objc_msgSend(v14, "setAccessibilityLabel:", v13);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionTitle, 0);
  objc_storeStrong((id *)&self->_actionImage, 0);
}

@end
