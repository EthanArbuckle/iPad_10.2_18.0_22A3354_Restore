@implementation STSpinnerViewController

- (STSpinnerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  STSpinnerViewController *v4;
  STSpinnerViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STSpinnerViewController;
  v4 = -[STSpinnerViewController initWithNibName:bundle:](&v7, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
    -[STSpinnerViewController _commonInit](v4, "_commonInit");
  return v5;
}

- (STSpinnerViewController)initWithCoder:(id)a3
{
  STSpinnerViewController *v3;
  STSpinnerViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STSpinnerViewController;
  v3 = -[STSpinnerViewController initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[STSpinnerViewController _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  UIActivityIndicatorView *v3;
  UIActivityIndicatorView *spinnerView;

  v3 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
  spinnerView = self->_spinnerView;
  self->_spinnerView = v3;

  -[UIActivityIndicatorView setTranslatesAutoresizingMaskIntoConstraints:](self->_spinnerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIActivityIndicatorView startAnimating](self->_spinnerView, "startAnimating");
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t v16[8];
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)STSpinnerViewController;
  -[STSpinnerViewController viewDidLoad](&v17, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSpinnerViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  -[STSpinnerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSubview:", self->_spinnerView);

  v6 = (void *)MEMORY[0x24BDD1628];
  -[UIActivityIndicatorView centerXAnchor](self->_spinnerView, "centerXAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSpinnerViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "centerXAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v10;
  -[UIActivityIndicatorView centerYAnchor](self->_spinnerView, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[STSpinnerViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "centerYAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activateConstraints:", v15);

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_219AB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "STUI:: STSpinnerViewController.viewDidLoad", v16, 2u);
  }
}

- (UIActivityIndicatorView)spinnerView
{
  return self->_spinnerView;
}

- (void)setSpinnerView:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinnerView, 0);
}

@end
