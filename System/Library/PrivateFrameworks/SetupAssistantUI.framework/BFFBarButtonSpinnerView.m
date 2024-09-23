@implementation BFFBarButtonSpinnerView

- (BFFBarButtonSpinnerView)init
{
  BFFBarButtonSpinnerView *v2;
  uint64_t v3;
  UIActivityIndicatorView *spinner;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BFFBarButtonSpinnerView;
  v2 = -[UIBarItem init](&v13, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    spinner = v2->_spinner;
    v2->_spinner = (UIActivityIndicatorView *)v3;

    -[UIActivityIndicatorView frame](v2->_spinner, "frame");
    v6 = v5;
    v8 = v7;
    v9 = *MEMORY[0x24BDBF090];
    v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[UIActivityIndicatorView setFrame:](v2->_spinner, "setFrame:");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v9, v10, v6, v8);
    objc_msgSend(v11, "addSubview:", v2->_spinner);
    -[BFFBarButtonSpinnerView setCustomView:](v2, "setCustomView:", v11);

  }
  return v2;
}

- (void)startAnimating
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
