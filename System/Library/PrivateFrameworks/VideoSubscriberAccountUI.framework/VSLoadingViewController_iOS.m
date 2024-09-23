@implementation VSLoadingViewController_iOS

- (VSLoadingViewController_iOS)initWithCoder:(id)a3
{
  VSLoadingViewController_iOS *v3;
  VSLoadingViewController_iOS *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VSLoadingViewController_iOS;
  v3 = -[VSLoadingViewController_iOS initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    commonInit_3(v3);
  return v4;
}

- (VSLoadingViewController_iOS)initWithNibName:(id)a3 bundle:(id)a4
{
  VSLoadingViewController_iOS *v4;
  VSLoadingViewController_iOS *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VSLoadingViewController_iOS;
  v4 = -[VSLoadingViewController_iOS initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    commonInit_3(v4);
  return v5;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)VSLoadingViewController_iOS;
  -[VSLoadingViewController_iOS viewDidLoad](&v24, sel_viewDidLoad);
  -[VSLoadingViewController_iOS view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "groupTableViewBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  -[VSLoadingViewController_iOS loadingIndicator](self, "loadingIndicator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v5, "setHidesWhenStopped:", 1);
  -[VSLoadingViewController_iOS updateAnimating](self, "updateAnimating");
  objc_msgSend(v3, "addSubview:", v5);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v5, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v9);

  objc_msgSend(v5, "centerYAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v12);

  -[VSLoadingViewController_iOS label](self, "label");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v3, "addSubview:", v13);
  objc_msgSend((id)objc_opt_class(), "layoutSpacing");
  v15 = v14;
  objc_msgSend(v5, "centerXAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "centerXAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "constraintEqualToAnchor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v18);

  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v13, 3, 0, v5, 4, 1.0, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v19);

  objc_msgSend(MEMORY[0x24BDD1628], "activateConstraints:", v6);
  if (-[VSLoadingViewController_iOS isCancellationAllowed](self, "isCancellationAllowed"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CANCEL_TITLE"), 0, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithTitle:style:target:action:", v21, 0, self, sel__cancelButtonPressed_);
    -[VSLoadingViewController_iOS navigationItem](self, "navigationItem");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setLeftBarButtonItem:", v22);

  }
}

- (void)setIsAnimating:(BOOL)a3
{
  self->_isAnimating = a3;
}

- (void)updateAnimating
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  id v6;

  v3 = -[VSLoadingViewController_iOS isAnimating](self, "isAnimating");
  -[VSLoadingViewController_iOS loadingIndicator](self, "loadingIndicator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "startAnimating");
  else
    objc_msgSend(v4, "stopAnimating");

  -[VSLoadingViewController_iOS label](self, "label");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", -[VSLoadingViewController_iOS isAnimating](self, "isAnimating") ^ 1);

}

- (void)setLoadingTitle:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "defaultLoadingTitle");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[VSLoadingViewController_iOS label](self, "label");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uppercaseString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v8);

}

- (NSString)loadingTitle
{
  void *v2;
  void *v3;

  -[VSLoadingViewController_iOS label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The textOrNil parameter must not be nil."));
  return (NSString *)v3;
}

+ (NSString)defaultLoadingTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("LOADING_TITLE_NO_ELLIPSIS"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)signingOutTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "vs_frameworkBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SIGNING_OUT_TITLE"), 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (double)layoutSpacing
{
  return 8.0;
}

- (void)_cancelButtonPressed:(id)a3
{
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  VSDefaultLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[VSLoadingViewController_iOS _cancelButtonPressed:]";
    _os_log_impl(&dword_2303C5000, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }

  -[VSLoadingViewController_iOS delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "loadingViewControllerDidCancel:", self);

}

- (VSLoadingViewControllerDelegate)delegate
{
  return (VSLoadingViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isCancellationAllowed
{
  return self->_cancellationAllowed;
}

- (void)setCancellationAllowed:(BOOL)a3
{
  self->_cancellationAllowed = a3;
}

- (BOOL)isAnimating
{
  return self->_isAnimating;
}

- (UIActivityIndicatorView)loadingIndicator
{
  return self->_loadingIndicator;
}

- (void)setLoadingIndicator:(id)a3
{
  objc_storeStrong((id *)&self->_loadingIndicator, a3);
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_loadingIndicator, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
