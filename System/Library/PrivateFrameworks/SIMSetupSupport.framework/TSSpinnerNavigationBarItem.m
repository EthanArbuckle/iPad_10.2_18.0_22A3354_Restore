@implementation TSSpinnerNavigationBarItem

- (TSSpinnerNavigationBarItem)init
{
  TSSpinnerNavigationBarItem *v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TSSpinnerNavigationBarItem;
  v2 = -[UIBarItem init](&v12, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 100);
    -[TSSpinnerNavigationBarItem setActivityIndicator:](v2, "setActivityIndicator:", v3);

    v4 = objc_alloc(MEMORY[0x24BEBDB00]);
    -[TSSpinnerNavigationBarItem activityIndicator](v2, "activityIndicator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "frame");
    v7 = v6;
    -[TSSpinnerNavigationBarItem activityIndicator](v2, "activityIndicator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v9 = (void *)objc_msgSend(v4, "initWithFrame:", 0.0, 0.0, v7);

    -[TSSpinnerNavigationBarItem activityIndicator](v2, "activityIndicator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[TSSpinnerNavigationBarItem setCustomView:](v2, "setCustomView:", v9);
  }
  return v2;
}

- (void)startAnimating
{
  id v2;

  -[TSSpinnerNavigationBarItem activityIndicator](self, "activityIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAnimating");

}

- (void)stopAnimating
{
  id v2;

  -[TSSpinnerNavigationBarItem activityIndicator](self, "activityIndicator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopAnimating");

}

- (UIActivityIndicatorView)activityIndicator
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 400, 1);
}

- (void)setActivityIndicator:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 400);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end
