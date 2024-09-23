@implementation RUIBarButtonSpinnerView

- (RUIBarButtonSpinnerView)initWithActivityIndicatorStyle:(int64_t)a3
{
  RUIBarButtonSpinnerView *v4;
  uint64_t v5;
  UIActivityIndicatorView *spinner;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)RUIBarButtonSpinnerView;
  v4 = -[UIBarItem init](&v19, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", a3);
    spinner = v4->_spinner;
    v4->_spinner = (UIActivityIndicatorView *)v5;

    -[UIActivityIndicatorView frame](v4->_spinner, "frame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v15 = *MEMORY[0x24BDBF090];
    v16 = *(double *)(MEMORY[0x24BDBF090] + 8);
    -[UIActivityIndicatorView setHidesWhenStopped:](v4->_spinner, "setHidesWhenStopped:", 1);
    -[UIActivityIndicatorView setFrame:](v4->_spinner, "setFrame:", v8, v10, v12, v14);
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v15, v16, v12, v14);
    objc_msgSend(v17, "addSubview:", v4->_spinner);
    -[RUIBarButtonSpinnerView setCustomView:](v4, "setCustomView:", v17);

  }
  return v4;
}

- (void)startAnimating
{
  -[UIActivityIndicatorView startAnimating](self->_spinner, "startAnimating");
}

- (void)stopAnimating
{
  -[UIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
}

- (void)setTintColor:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RUIBarButtonSpinnerView;
  v4 = a3;
  -[RUIBarButtonSpinnerView setTintColor:](&v5, sel_setTintColor_, v4);
  -[UIActivityIndicatorView setColor:](self->_spinner, "setColor:", v4, v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
}

@end
