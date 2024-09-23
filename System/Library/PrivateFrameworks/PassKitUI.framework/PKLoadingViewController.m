@implementation PKLoadingViewController

- (PKLoadingViewController)initWithDelegate:(id)a3
{
  id v4;
  PKLoadingViewController *v5;
  PKLoadingViewController *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKLoadingViewController;
  v5 = -[PKLoadingViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    -[PKLoadingViewController navigationItem](v6, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, v6, sel__cancelButtonTapped_);
    objc_msgSend(v7, "setLeftBarButtonItem:", v8);
    v9 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
    objc_msgSend(v9, "configureWithTransparentBackground");
    objc_msgSend(v7, "setStandardAppearance:", v9);

  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  UIActivityIndicatorView *v5;
  UIActivityIndicatorView *spinner;
  id v7;
  UILabel *v8;
  UILabel *loadingLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PKLoadingViewController;
  -[PKLoadingViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[PKLoadingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  spinner = self->_spinner;
  self->_spinner = v5;

  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
  objc_msgSend(v3, "addSubview:", self->_spinner);
  v7 = objc_alloc(MEMORY[0x1E0DC3990]);
  v8 = (UILabel *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  loadingLabel = self->_loadingLabel;
  self->_loadingLabel = v8;

  v10 = self->_loadingLabel;
  PKLocalizedString(CFSTR("LOADING"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](v10, "setText:", v11);

  v12 = self->_loadingLabel;
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](v12, "setTextColor:", v13);

  objc_msgSend(v3, "addSubview:", self->_loadingLabel);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;

  v18.receiver = self;
  v18.super_class = (Class)PKLoadingViewController;
  -[PKLoadingViewController viewDidLayoutSubviews](&v18, sel_viewDidLayoutSubviews);
  -[PKLoadingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[UIActivityIndicatorView frame](self->_spinner, "frame");
  objc_msgSend(v3, "center");
  UIRectCenteredAboutPoint();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:");
  -[UILabel sizeToFit](self->_loadingLabel, "sizeToFit");
  -[UILabel frame](self->_loadingLabel, "frame");
  UIRectCenteredXInRect();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19.origin.x = v5;
  v19.origin.y = v7;
  v19.size.width = v9;
  v19.size.height = v11;
  -[UILabel setFrame:](self->_loadingLabel, "setFrame:", v13, CGRectGetMaxY(v19) + 10.0, v15, v17);

}

- (void)_cancelButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "loadingViewControllerDidCancel:", self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
